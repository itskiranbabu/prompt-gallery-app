# Deployment Guide

## 🚀 Vercel Deployment

### Quick Deploy
[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/itskiranbabu/prompt-gallery-app)

### Manual Deployment Steps

1. **Connect GitHub Repository**
   - Go to [Vercel Dashboard](https://vercel.com/dashboard)
   - Click "New Project"
   - Import `itskiranbabu/prompt-gallery-app`

2. **Configure Environment Variables**
   ```bash
   NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

3. **Deploy**
   - Click "Deploy"
   - Wait for build completion
   - Access your live app!

## 🗄️ Supabase Setup

### 1. Create Supabase Project
- Go to [Supabase Dashboard](https://supabase.com/dashboard)
- Create new project
- Note your Project URL and API Keys

### 2. Run Database Migrations
```sql
-- Copy and paste the contents of each migration file:
-- 1. supabase/migrations/001_create_prompt_gallery_schema.sql
-- 2. supabase/migrations/002_create_rls_policies.sql  
-- 3. supabase/migrations/003_seed_data.sql
```

### 3. Configure Authentication
- Enable Email/Password authentication
- Configure OAuth providers (optional)
- Set up email templates

## 🔧 Environment Variables

### Required Variables
```env
# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key

# Optional: Service Role Key (for admin functions)
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

### Admin Agent Variables (for later)
```env
# Google Drive API
GOOGLE_DRIVE_CLIENT_ID=your-client-id
GOOGLE_DRIVE_CLIENT_SECRET=your-client-secret
GOOGLE_DRIVE_REFRESH_TOKEN=your-refresh-token

# Google Sheets API
GOOGLE_SHEETS_SPREADSHEET_ID=your-spreadsheet-id

# Firecrawl API
FIRECRAWL_API_KEY=your-firecrawl-key

# Slack Integration
SLACK_BOT_TOKEN=your-bot-token
SLACK_CHANNEL_ID=your-channel-id
```

## 🔄 Automatic Deployment

### GitHub Actions
- Automatic deployment on push to `main` branch
- Build verification on pull requests
- Environment variable validation

### Vercel Integration
- Automatic builds from GitHub
- Preview deployments for PRs
- Production deployment on merge

## 🌐 Custom Domain (Optional)

1. **Add Domain in Vercel**
   - Go to Project Settings → Domains
   - Add your custom domain
   - Configure DNS records

2. **SSL Certificate**
   - Automatically provisioned by Vercel
   - HTTPS enabled by default

## 📊 Monitoring

### Vercel Analytics
- Real-time performance metrics
- User engagement tracking
- Error monitoring

### Supabase Monitoring
- Database performance
- API usage statistics
- Authentication metrics

## 🚨 Troubleshooting

### Common Issues

1. **Build Failures**
   - Check environment variables
   - Verify Supabase connection
   - Review build logs

2. **Database Connection**
   - Verify Supabase URL and keys
   - Check RLS policies
   - Ensure migrations are applied

3. **Authentication Issues**
   - Configure Supabase Auth settings
   - Check redirect URLs
   - Verify email templates

### Support
- Check [Vercel Documentation](https://vercel.com/docs)
- Review [Supabase Guides](https://supabase.com/docs)
- Open GitHub Issues for project-specific problems