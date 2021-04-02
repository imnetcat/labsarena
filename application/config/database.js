({
  connectionString: process.env.DATABASE_URL || 'postgresql://postgres:admin@localhost:5432/postgres',
  ssl: !!process.env.DATABASE_URL
});
