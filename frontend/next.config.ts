// next.config.js
import type { NextConfig } from 'next';

const nextConfig: NextConfig = {
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'cdn.builder.io',
        pathname: '/**', // Có thể tùy chỉnh nếu bạn chỉ muốn cho phép một số đường dẫn cụ thể
      },
    ],
  },
};

export default nextConfig;