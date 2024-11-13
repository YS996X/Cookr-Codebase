-- First drop the triggers
DROP TRIGGER IF EXISTS update_notes_updated_at ON notes;
DROP TRIGGER IF EXISTS update_subscriptions_updated_at ON subscriptions;

-- Then drop the function
DROP FUNCTION IF EXISTS update_updated_at_column();

-- Now create the secure function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER 
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Finally recreate the triggers
CREATE TRIGGER update_notes_updated_at
    BEFORE UPDATE ON notes
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_subscriptions_updated_at
    BEFORE UPDATE ON subscriptions
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();
-- Users table
create table users (
  id uuid references auth.users primary key,
  username text unique,
  name text,
  email text unique,
  profile_picture text,
  aura_points int default 0,
  streak int default 0,
  subscription_status text default 'free',
  created_at timestamp with time zone default timezone('utc'::text, now())
);

-- Notes table
create table notes (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references users(id),
  title text,
  content text,
  is_pdf boolean default false,
  created_at timestamp with time zone default timezone('utc'::text, now())
);

-- Study Sets table
create table study_sets (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references users(id),
  title text,
  created_at timestamp with time zone default timezone('utc'::text, now())
);
CREATE TABLE shared_questions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  question_id UUID REFERENCES questions(id),
  user_id UUID REFERENCES users(id),
  sharing_id TEXT UNIQUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  expires_at TIMESTAMP WITH TIME ZONE
);
SELECT
  table_name
FROM
  information_schema.tables
WHERE
  table_schema = 'public';
