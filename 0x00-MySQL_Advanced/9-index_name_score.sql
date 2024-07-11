USE holberton;

-- Drop index if exists (optional, to ensure clean setup)
DROP INDEX IF EXISTS idx_name_first_score ON names;

-- Create index on the first letter of name and score
CREATE INDEX idx_name_first_score ON names (LEFT(name, 1), score);
