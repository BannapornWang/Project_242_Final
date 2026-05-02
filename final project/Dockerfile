# =============================================================================
# Dockerfile — Node.js 18 Trading Card Game Shop API
# Multi-stage build | Non-root user | Production-ready
# =============================================================================

# -----------------------------------------------------------------------------
# STAGE 1: "builder" — install ALL dependencies (including devDependencies)
#           and compile/transpile if needed
# -----------------------------------------------------------------------------
FROM node:18-alpine AS builder

LABEL maintainer="TCG Shop Team"
LABEL description="Trading Card Game Shop — Yugioh, Vanguard, MLP, Gundam"

# Set working directory
WORKDIR /app

# Copy package manifests first (leverage Docker layer cache)
# If package.json hasn't changed, npm install layer is reused
COPY package.json package-lock.json* ./

# Install ALL dependencies (dev + prod) needed for build/compile steps
RUN npm ci --frozen-lockfile

# Copy the rest of the application source code
COPY . .

# Run any build steps (e.g., TypeScript compile, Babel transpile)
# Comment out if you don't have a build script
# RUN npm run build

# Prune devDependencies — keep only production deps for the final image
RUN npm prune --production

# -----------------------------------------------------------------------------
# STAGE 2: "production" — lean runtime image with only what's needed
# -----------------------------------------------------------------------------
FROM node:18-alpine AS production

# Security: set NODE_ENV to production
ENV NODE_ENV=production
ENV PORT=3000

WORKDIR /app

# Create a non-root user and group for security
# Running as root inside Docker is a security risk
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy only production artifacts from the builder stage
COPY --from=builder --chown=appuser:appgroup /app/node_modules ./node_modules
COPY --from=builder --chown=appuser:appgroup /app/package.json ./package.json
COPY --from=builder --chown=appuser:appgroup /app/src ./src

# Switch to the non-root user before running the app
USER appuser

# Expose the application port
EXPOSE 3000

# Health check for the Node.js app itself
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -qO- http://localhost:3000/health || exit 1

# Start the application
CMD ["node", "src/index.js"]
