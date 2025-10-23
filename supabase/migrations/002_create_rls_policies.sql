-- Enable Row Level Security on all tables
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE prompts ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE likes ENABLE ROW LEVEL SECURITY;
ALTER TABLE collections ENABLE ROW LEVEL SECURITY;
ALTER TABLE collection_prompts ENABLE ROW LEVEL SECURITY;
ALTER TABLE admin_logs ENABLE ROW LEVEL SECURITY;

-- Categories policies (public read, admin write)
CREATE POLICY "Categories are viewable by everyone" ON categories FOR SELECT USING (true);
CREATE POLICY "Categories are insertable by admins" ON categories FOR INSERT WITH CHECK (
  EXISTS (SELECT 1 FROM user_profiles WHERE id = auth.uid() AND is_admin = true)
);
CREATE POLICY "Categories are updatable by admins" ON categories FOR UPDATE USING (
  EXISTS (SELECT 1 FROM user_profiles WHERE id = auth.uid() AND is_admin = true)
);
CREATE POLICY "Categories are deletable by admins" ON categories FOR DELETE USING (
  EXISTS (SELECT 1 FROM user_profiles WHERE id = auth.uid() AND is_admin = true)
);

-- Prompts policies
CREATE POLICY "Public prompts are viewable by everyone" ON prompts FOR SELECT USING (
  is_public = true OR user_id = auth.uid()
);
CREATE POLICY "Users can insert their own prompts" ON prompts FOR INSERT WITH CHECK (
  auth.uid() = user_id
);
CREATE POLICY "Users can update their own prompts" ON prompts FOR UPDATE USING (
  auth.uid() = user_id
);
CREATE POLICY "Users can delete their own prompts" ON prompts FOR DELETE USING (
  auth.uid() = user_id
);

-- User profiles policies
CREATE POLICY "Profiles are viewable by everyone" ON user_profiles FOR SELECT USING (true);
CREATE POLICY "Users can insert their own profile" ON user_profiles FOR INSERT WITH CHECK (
  auth.uid() = id
);
CREATE POLICY "Users can update their own profile" ON user_profiles FOR UPDATE USING (
  auth.uid() = id
);

-- Likes policies
CREATE POLICY "Likes are viewable by everyone" ON likes FOR SELECT USING (true);
CREATE POLICY "Users can insert their own likes" ON likes FOR INSERT WITH CHECK (
  auth.uid() = user_id
);
CREATE POLICY "Users can delete their own likes" ON likes FOR DELETE USING (
  auth.uid() = user_id
);

-- Collections policies
CREATE POLICY "Public collections are viewable by everyone" ON collections FOR SELECT USING (
  is_public = true OR user_id = auth.uid()
);
CREATE POLICY "Users can insert their own collections" ON collections FOR INSERT WITH CHECK (
  auth.uid() = user_id
);
CREATE POLICY "Users can update their own collections" ON collections FOR UPDATE USING (
  auth.uid() = user_id
);
CREATE POLICY "Users can delete their own collections" ON collections FOR DELETE USING (
  auth.uid() = user_id
);

-- Collection prompts policies
CREATE POLICY "Collection prompts are viewable based on collection visibility" ON collection_prompts FOR SELECT USING (
  EXISTS (
    SELECT 1 FROM collections 
    WHERE id = collection_id 
    AND (is_public = true OR user_id = auth.uid())
  )
);
CREATE POLICY "Users can manage their own collection prompts" ON collection_prompts FOR ALL USING (
  EXISTS (
    SELECT 1 FROM collections 
    WHERE id = collection_id 
    AND user_id = auth.uid()
  )
);

-- Admin logs policies (admin only)
CREATE POLICY "Admin logs are viewable by admins only" ON admin_logs FOR SELECT USING (
  EXISTS (SELECT 1 FROM user_profiles WHERE id = auth.uid() AND is_admin = true)
);
CREATE POLICY "Admin logs are insertable by admins only" ON admin_logs FOR INSERT WITH CHECK (
  EXISTS (SELECT 1 FROM user_profiles WHERE id = auth.uid() AND is_admin = true)
);