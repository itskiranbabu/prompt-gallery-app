# Prompt Gallery App

A modern, AI-powered prompt gallery application with multi-agent workflow integration.

## 🚀 Features

- **Modern UI/UX** - Built with Next.js 14 and Tailwind CSS
- **Multi-Agent Workflow** - Integrated with Bhindi's agent ecosystem
- **Smart Content Management** - Automated image scraping and organization
- **Real-time Database** - Powered by Supabase
- **Cloud Deployment** - Deployed on Vercel

## 🛠️ Tech Stack

- **Frontend**: Next.js 14, React 18, Tailwind CSS
- **Backend**: Supabase (Database + Auth)
- **Deployment**: Vercel
- **Automation**: Bhindi Multi-Agent System
- **Storage**: Google Drive integration
- **Tracking**: Google Sheets logging

## 🏗️ Architecture

### Core App Components
- **GitHub Agent** - Repository management & version control
- **Vercel Agent** - Deployment & hosting
- **Supabase Agent** - Database & authentication
- **Notion Agent** - Documentation & project planning
- **Slack Agent** - Team communication

### Admin Agent Pipeline
- **Firecrawl Agent** - Web scraping & image extraction
- **Google Drive Agent** - Image storage & organization
- **Google Sheets Agent** - Activity logging & tracking
- **Scheduler Agent** - Automated workflow management

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/itskiranbabu/prompt-gallery-app.git
   cd prompt-gallery-app
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   ```bash
   cp .env.example .env.local
   # Add your Supabase and other API keys
   ```

4. **Run the development server**
   ```bash
   npm run dev
   ```

5. **Open [http://localhost:3000](http://localhost:3000)**

## 📁 Project Structure

```
prompt-gallery-app/
├── app/                    # Next.js 14 app directory
│   ├── globals.css        # Global styles
│   ├── layout.tsx         # Root layout
│   └── page.tsx           # Homepage
├── components/            # Reusable components
├── lib/                   # Utility functions
├── public/               # Static assets
├── supabase/             # Database schemas & migrations
└── docs/                 # Documentation
```

## 🔧 Configuration

### Environment Variables
```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
```

## 🤖 Multi-Agent Workflow

This app leverages Bhindi's multi-agent system for:
- Automated content discovery
- Smart image processing
- Real-time synchronization
- Intelligent categorization
- Workflow automation

## 📊 Admin Dashboard

The admin agent provides:
- Web scraping automation
- Google Drive organization
- Activity tracking in Google Sheets
- Manual trigger controls
- Batch processing capabilities

## 🚀 Deployment

Automatically deployed to Vercel on every push to main branch.

## 📝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- Built with [Bhindi](https://bhindi.io) multi-agent system
- Powered by [Supabase](https://supabase.com)
- Deployed on [Vercel](https://vercel.com)