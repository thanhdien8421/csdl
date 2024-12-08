'use client'; // Đảm bảo component này chỉ chạy ở client-side

import { useState, useEffect } from "react";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import localFont from "next/font/local";
import "./globals.css";
import StoreProvider from "../store/StoreProvider";

const geistSans = localFont({
  src: "./fonts/GeistVF.woff",
  variable: "--font-geist-sans",
  weight: "100 900",
});

const geistMono = localFont({
  src: "./fonts/GeistMonoVF.woff",
  variable: "--font-geist-mono",
  weight: "100 900",
});

export default function RootLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  const [queryClient, setQueryClient] = useState<QueryClient | null>(null); // State để lưu QueryClient instance

  useEffect(() => {
    setQueryClient(new QueryClient()); // Chỉ tạo QueryClient khi đã chắc chắn đang ở client-side
  }, []);

  if (!queryClient) return null;

  return (
    <QueryClientProvider client={queryClient}>
      {/* Render phần thân ứng dụng */}
      <div className={`${geistSans.variable} ${geistMono.variable} antialiased`}>
        <StoreProvider>{children}</StoreProvider>
      </div>
    </QueryClientProvider>
  );
}
