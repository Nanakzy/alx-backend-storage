USE holberton;

-- Drop index if exists (optional, to ensure clean setup)
DROP INDEX IF EXISTS idx_name_first ON names;

-- Create index on the first letter of name
CREATE INDEX idx_name_first ON names (LEFT(name, 1));
