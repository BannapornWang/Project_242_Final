const cassandra = require('cassandra-driver');
require('dotenv').config();

const client = new cassandra.Client({
  contactPoints: [process.env.CASSANDRA_HOST || '127.0.0.1'],
  localDataCenter: process.env.CASSANDRA_DC || 'datacenter1',
  keyspace: process.env.CASSANDRA_KEYSPACE || 'trading_card_shop',
  pooling: {
    coreConnectionsPerHost: {
      [cassandra.types.distance.local]: 2,
    },
  },
});

module.exports = client;
