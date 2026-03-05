FROM n8nio/n8n:latest

# Set environment variables
ENV N8N_USER_FOLDER=/data
ENV N8N_METRICS=true
ENV NODE_OPTIONS="--max-old-space-size=2048"

# Expose port
EXPOSE 5678

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD node -e "require('http').get('http://localhost:5678/api/v1/settings', (r) => {if (r.statusCode !== 200) throw new Error(r.statusCode)})"

# Start command
CMD ["node", "/data/dist/bin/n8n", "start"]
