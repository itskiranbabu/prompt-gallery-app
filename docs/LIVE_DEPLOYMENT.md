# 🚀 Live Deployment Instructions

## Step 1: Supabase Database Setup

### 1.1 Create Supabase Project
1. Go to [Supabase Dashboard](https://supabase.com/dashboard)
2. Create a new project
3. Wait for project initialization

### 1.2 Run Database Migrations
Copy and execute these SQL commands in Supabase SQL Editor:

**Migration 1: Create Schema**
```sql
-- Copy entire content from: supabase/migrations/001_create_prompt_gallery_schema.sql
```

**Migration 2: Create RLS Policies**  
```sql
-- Copy entire content from: supabase/migrations/002_create_rls_policies.sql
```

**Migration 3: Seed Data**
```sql
-- Copy entire content from: supabase/migrations/003_seed_data.sql
```

### 1.3 Get Supabase Credentials
- Project URL: `https://your-project.supabase.co`
- Anon Key: Found in Project Settings → API
- Service Role Key: Found in Project Settings → API

## Step 2: Vercel Deployment

### 2.1 Connect GitHub Repository
1. Go to [Vercel Dashboard](https://vercel.com/dashboard)
2. Click "New Project"
3. Import: `itskiranbabu/prompt-gallery-app`
4. Configure build settings:
   - Framework: Next.js
   - Build Command: `npm run build`
   - Output Directory: `.next`

### 2.2 Configure Environment Variables
Add these in Vercel Project Settings → Environment Variables:

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
```

### 2.3 Deploy
1. Click "Deploy"
2. Wait for build completion
3. Get deployment URL

## Step 3: Test Live App

### 3.1 Verify Deployment
- [ ] App loads successfully
- [ ] Homepage displays sample prompts
- [ ] Categories are visible
- [ ] Search functionality works
- [ ] No console errors

### 3.2 Test Database Connectivity
- [ ] Prompts load from Supabase
- [ ] Categories display correctly
- [ ] API endpoints respond
- [ ] Database queries execute

### 3.3 Test Features
- [ ] Gallery grid displays
- [ ] Search and filter work
- [ ] Responsive design functions
- [ ] Performance is acceptable

## Step 4: Post-Deployment

### 4.1 Monitor Performance
- Check Vercel Analytics
- Monitor Supabase usage
- Review error logs

### 4.2 Configure Custom Domain (Optional)
- Add domain in Vercel
- Update DNS records
- Verify SSL certificate

## 🆘 Troubleshooting

### Common Issues:
1. **Build Failures**: Check environment variables
2. **Database Errors**: Verify Supabase connection
3. **API Issues**: Check RLS policies
4. **Performance**: Monitor bundle size

### Support Resources:
- Vercel Documentation
- Supabase Guides  
- GitHub Issues
- Project README

---

## 📊 Expected Results

**Live App URL**: `https://prompt-gallery-app-[hash].vercel.app`

**Features Working**:
- ✅ Homepage with gallery grid
- ✅ 6 sample prompts displayed
- ✅ 10 categories available
- ✅ Search and filter functionality
- ✅ Responsive design
- ✅ Fast loading performance

**Database**:
- ✅ Categories table with 10 entries
- ✅ Prompts table with 6 sample prompts
- ✅ User profiles ready for authentication
- ✅ RLS policies securing data access