-- Insert default categories
INSERT INTO categories (name, description, color) VALUES
('AI Art', 'Prompts for generating artistic images and creative visuals', '#8B5CF6'),
('Photography', 'Prompts for realistic photo-style generations', '#10B981'),
('UI/UX Design', 'Prompts for interface and user experience designs', '#3B82F6'),
('Character Design', 'Prompts for creating characters and personas', '#F59E0B'),
('Landscapes', 'Prompts for natural and fantasy landscapes', '#06B6D4'),
('Abstract', 'Prompts for abstract and conceptual art', '#EF4444'),
('Logo Design', 'Prompts for brand and logo creation', '#8B5CF6'),
('Architecture', 'Prompts for building and structural designs', '#6B7280'),
('Fashion', 'Prompts for clothing and fashion designs', '#EC4899'),
('Gaming', 'Prompts for game assets and gaming-related content', '#F97316');

-- Insert sample prompts (these will be replaced by admin agent later)
INSERT INTO prompts (title, description, prompt_text, image_url, category_id, user_id, tags, is_featured) VALUES
(
  'Cyberpunk Cityscape',
  'A futuristic neon-lit cityscape with flying cars and holographic advertisements',
  'A sprawling cyberpunk metropolis at night, neon lights reflecting off wet streets, flying cars weaving between towering skyscrapers, holographic billboards advertising futuristic products, rain falling, cinematic lighting, ultra-detailed, 8K resolution',
  'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=800',
  (SELECT id FROM categories WHERE name = 'AI Art'),
  NULL,
  ARRAY['cyberpunk', 'futuristic', 'neon', 'cityscape', 'night'],
  true
),
(
  'Minimalist Logo Design',
  'Clean and modern logo design with geometric shapes',
  'A minimalist logo design featuring clean geometric shapes, modern typography, monochromatic color scheme, professional appearance, scalable vector graphics, suitable for tech company branding',
  'https://images.unsplash.com/photo-1611224923853-80b023f02d71?w=800',
  (SELECT id FROM categories WHERE name = 'Logo Design'),
  NULL,
  ARRAY['minimalist', 'logo', 'geometric', 'modern', 'branding'],
  true
),
(
  'Fantasy Character Portrait',
  'Detailed fantasy character with magical elements',
  'A detailed portrait of a fantasy elf warrior, intricate armor with glowing runes, long flowing hair, piercing eyes, magical aura, forest background, digital painting style, high fantasy art, detailed textures',
  'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=800',
  (SELECT id FROM categories WHERE name = 'Character Design'),
  NULL,
  ARRAY['fantasy', 'character', 'elf', 'warrior', 'magic'],
  false
),
(
  'Modern UI Dashboard',
  'Clean and intuitive dashboard interface design',
  'A modern web dashboard interface with clean layout, data visualization charts, card-based design, subtle shadows, professional color scheme, responsive design, user-friendly navigation, glassmorphism elements',
  'https://images.unsplash.com/photo-1551650975-87deedd944c3?w=800',
  (SELECT id FROM categories WHERE name = 'UI/UX Design'),
  NULL,
  ARRAY['ui', 'dashboard', 'modern', 'clean', 'interface'],
  true
),
(
  'Serene Mountain Landscape',
  'Peaceful mountain scene with lake reflection',
  'A serene mountain landscape at golden hour, crystal clear lake reflecting snow-capped peaks, pine trees in foreground, soft clouds, warm lighting, peaceful atmosphere, nature photography style, high resolution',
  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
  (SELECT id FROM categories WHERE name = 'Landscapes'),
  NULL,
  ARRAY['landscape', 'mountains', 'lake', 'nature', 'peaceful'],
  false
),
(
  'Abstract Geometric Art',
  'Colorful abstract composition with geometric patterns',
  'An abstract geometric composition with vibrant colors, overlapping shapes, gradient transitions, modern art style, balanced composition, dynamic movement, contemporary design, digital art',
  'https://images.unsplash.com/photo-1541961017774-22349e4a1262?w=800',
  (SELECT id FROM categories WHERE name = 'Abstract'),
  NULL,
  ARRAY['abstract', 'geometric', 'colorful', 'modern', 'art'],
  false
);

-- Create a function to handle user profile creation on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.user_profiles (id, username, full_name, avatar_url)
  VALUES (
    NEW.id,
    NEW.raw_user_meta_data->>'username',
    NEW.raw_user_meta_data->>'full_name',
    NEW.raw_user_meta_data->>'avatar_url'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create trigger to automatically create user profile on signup
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Create function to update likes count
CREATE OR REPLACE FUNCTION update_likes_count()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    UPDATE prompts SET likes_count = likes_count + 1 WHERE id = NEW.prompt_id;
    RETURN NEW;
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE prompts SET likes_count = likes_count - 1 WHERE id = OLD.prompt_id;
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Create triggers for likes count
CREATE TRIGGER update_likes_count_trigger
  AFTER INSERT OR DELETE ON likes
  FOR EACH ROW EXECUTE FUNCTION update_likes_count();