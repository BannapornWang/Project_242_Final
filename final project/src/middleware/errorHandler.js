module.exports = function errorHandler(err, req, res, next) {
  console.error('[ERROR]', err.message || err);

  if (err.name === 'ResponseError' && err.code === 0x1000) {
     return res.status(503).json({ error: 'Cassandra Timeout Error', details: 'The database is overloaded or unavailable. Try again later.' });
  }
  if (err.name === 'NoHostAvailableError') {
     return res.status(503).json({ error: 'Cassandra Nodes Unavailable', details: 'All database nodes are currently down.' });
  }
  if (err.name === 'ResponseError') {
     return res.status(400).json({ error: 'Cassandra Query Error', details: err.message });
  }

  res.status(500).json({ error: 'Internal Server Error', details: err.message });
};
