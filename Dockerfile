FROM node:20-slim

WORKDIR /app

# Install required system dependencies
RUN apt-get update && \
    apt-get install -y git python3 make g++ && \
    rm -rf /var/lib/apt/lists/*

# Enable Corepack for Yarn
RUN corepack enable

# Copy root package files first
COPY package.json yarn.lock ./

# Copy all package.json files to their respective locations
COPY packages/app/package.json ./packages/app/
COPY packages/backend/package.json ./packages/backend/

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy the rest of the application
COPY . .

# Initialize git repository (required for Backstage)
RUN git init && \
    git config --global user.email "hoangtan.nht@gmail.com" && \
    git config --global user.name "tannht"

# Build the app package
RUN cd packages/app && yarn build

# Expose the default Backstage port
EXPOSE 3000

# Start the application
CMD ["yarn", "workspace", "app", "start"]
