uri = URI.parse ENV.fetch("REDIS_URL", 'http://localhost:6379')
REDIS_CONFIG = { host: uri.host, port: uri.port, db: 0 }
REDIS = Redis.new REDIS_CONFIG