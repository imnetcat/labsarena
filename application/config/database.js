({
  connectionString: process.env.DATABASE_URL || 'postgresql://imnetcat:imnetcat@localhost:5432/application',
  ssl: !!process.env.DATABASE_URL
});
