// app/layout.tsx (Root Layout)
import RootLayout from './RootLayout';

export default function AppLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <title>PizzaBest</title>
      <body>
        <RootLayout>{children}</RootLayout>
      </body>
    </html>
  );
}
