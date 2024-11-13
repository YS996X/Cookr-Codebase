const { supabase } = require('../services/supabase');
const paypal = require('@paypal/checkout-server-sdk');
const { sendEmergencyReport } = require('../utils/reportingHelper');

// Configure PayPal client
let environment = new paypal.core.SandboxEnvironment(process.env.PAYPAL_CLIENT_ID, process.env.PAYPAL_CLIENT_SECRET);
let client = new paypal.core.PayPalHttpClient(environment);

exports.createSubscription = async (req, res, next) => {
  try {
    const { user } = req;

    // Check if user already has an active subscription
    const { data: existingSubscription, error: subscriptionError } = await supabase
      .from('subscriptions')
      .select('status')
      .eq('user_id', user.id)
      .single();

    if (subscriptionError) throw subscriptionError;

    if (existingSubscription && existingSubscription.status === 'active') {
      return res.status(400).json({ message: 'User already has an active subscription' });
    }

    // Create PayPal subscription request
    let request = new paypal.subscriptions.SubscriptionsCreateRequest();
    request.prefer("return=representation");
    request.requestBody({
      plan_id: process.env.PAYPAL_PLAN_ID,
      subscriber: {
        name: {
          given_name: user.name
        },
        email_address: user.email
      }
    });

    // Call PayPal to set up a subscription
    let response;
    try {
      response = await client.execute(request);
    } catch (paypalError) {
      console.error('PayPal API error:', paypalError);
      return res.status(500).json({ message: 'Failed to create subscription with PayPal' });
    }

    // Store subscription info in Supabase
    const { data, error } = await supabase
      .from('subscriptions')
      .upsert({
        user_id: user.id,
        paypal_subscription_id: response.result.id,
        status: response.result.status
      });

    if (error) throw error;

    res.status(200).json({ subscriptionId: response.result.id });
  } catch (error) {
    sendEmergencyReport('SUBSCRIPTION_ERROR', `Error creating subscription for user ${req.user.id}: ${error.message}`, 'subscriptionController.js', '');
    next(error);
  }
};

exports.handleWebhook = async (req, res, next) => {
  try {
    const event = req.body;

    switch (event.event_type) {
      case 'BILLING.SUBSCRIPTION.ACTIVATED':
        await updateSubscriptionStatus(event.resource.id, 'active');
        break;
      case 'BILLING.SUBSCRIPTION.CANCELLED':
        await updateSubscriptionStatus(event.resource.id, 'cancelled');
        break;
      case 'BILLING.SUBSCRIPTION.SUSPENDED':
        await updateSubscriptionStatus(event.resource.id, 'suspended');
        break;
      case 'PAYMENT.SALE.COMPLETED':
        await handlePaymentCompleted(event.resource.id);
        break;
      case 'PAYMENT.SALE.REFUNDED':
        await handlePaymentRefunded(event.resource.id);
        break;
    }

    res.status(200).send('Webhook received');
  } catch (error) {
    sendEmergencyReport('WEBHOOK_ERROR', `Error processing PayPal webhook: ${error.message}`, 'subscriptionController.js', '');
    next(error);
  }
};

async function updateSubscriptionStatus(paypalSubscriptionId, status) {
  const { data, error } = await supabase
    .from('subscriptions')
    .update({ status: status })
    .eq('paypal_subscription_id', paypalSubscriptionId);

  if (error) throw error;

  await supabase
    .from('users')
    .update({ subscription_status: status === 'active' ? 'pro' : 'free' })
    .eq('id', data[0].user_id);
}

async function handlePaymentCompleted(saleId) {
  // Implement payment completion logic
  // For example, update user's subscription status or extend subscription period
}

async function handlePaymentRefunded(saleId) {
  // Implement refund logic
  // For example, cancel the user's subscription or adjust their subscription period
}

exports.getSubscriptionStatus = async (req, res, next) => {
  try {
    const { data, error } = await supabase
      .from('users')
      .select('subscription_status')
      .eq('id', req.user.id)
      .single();

    if (error) throw error;

    res.status(200).json({ subscriptionStatus: data.subscription_status });
  } catch (error) {
    next(error);
  }
};

exports.subscribe = async (req, res, next) => {
  try {
    // Implement subscription logic here
    // This might involve integrating with a payment gateway

    const { data, error } = await supabase
      .from('users')
      .update({ subscription_status: 'pro' })
      .eq('id', req.user.id);

    if (error) throw error;

    res.status(200).json({ message: 'Subscription successful' });
  } catch (error) {
    next(error);
  }
};

exports.unsubscribe = async (req, res, next) => {
  try {
    const { data, error } = await supabase
      .from('users')
      .update({ subscription_status: 'free' })
      .eq('id', req.user.id);

    if (error) throw error;

    res.status(200).json({ message: 'Unsubscription successful' });
  } catch (error) {
    next(error);
  }
};

exports.cancelSubscription = async (req, res, next) => {
  try {
    const { data: subscription, error: fetchError } = await supabase
      .from('subscriptions')
      .select('paypal_subscription_id')
      .eq('user_id', req.user.id)
      .single();

    if (fetchError) throw fetchError;

    if (!subscription) {
      return res.status(404).json({ message: 'No active subscription found' });
    }

    // Cancel subscription with PayPal
    let request = new paypal.subscriptions.SubscriptionsCancelRequest(subscription.paypal_subscription_id);
    request.requestBody({});
    await client.execute(request);

    // Update subscription status in database
    const { error: updateError } = await supabase
      .from('subscriptions')
      .update({ status: 'cancelled' })
      .eq('user_id', req.user.id);

    if (updateError) throw updateError;

    res.status(200).json({ message: 'Subscription cancelled successfully' });
  } catch (error) {
    next(error);
  }
};
