class Cache {
  constructor() {
    this.cache = new Map();
    this.stats = {
      hits: 0,
      misses: 0
    };
  }

  // Set with TTL (Time To Live)
  set(key, value, ttl = 300000) { // Default 5 minutes
    this.cache.set(key, {
      value,
      timestamp: Date.now(),
      ttl
    });
  }

  get(key) {
    const data = this.cache.get(key);
    if (!data) {
      this.stats.misses++;
      return null;
    }

    if (Date.now() - data.timestamp > data.ttl) {
      this.cache.delete(key);
      this.stats.misses++;
      return null;
    }

    this.stats.hits++;
    return data.value;
  }

  // Clear expired entries
  cleanup() {
    const now = Date.now();
    for (const [key, data] of this.cache.entries()) {
      if (now - data.timestamp > data.ttl) {
        this.cache.delete(key);
      }
    }
  }

  // Get cache stats
  getStats() {
    return {
      ...this.stats,
      size: this.cache.size,
      hitRate: this.stats.hits / (this.stats.hits + this.stats.misses)
    };
  }
}

// Create singleton instance
const globalCache = new Cache();

// Run cleanup every 5 minutes
setInterval(() => globalCache.cleanup(), 300000);

module.exports = globalCache;
