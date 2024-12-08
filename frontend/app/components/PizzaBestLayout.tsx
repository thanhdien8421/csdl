'use client';
import * as React from "react";
import { Logo } from "./Logo";
import { Button } from "./Button";
import { ResponsiveImage } from "./ResponsiveImage";
import { useRouter } from "next/navigation";

export const PizzaBestLayout: React.FC = () => {
  const router = useRouter(); // Khởi tạo useRouter

  const handleSignIn = React.useCallback(() => {
    // Khi bấm SIGN IN, chuyển hướng đến trang /login
    router.push("/login");
  }, [router]); // Đảm bảo router không bị thay đổi trong mỗi lần render
  
    return (
      <div className="flex overflow-hidden flex-col text-center bg-white text-zinc-800">
        <header className="flex flex-wrap gap-5 justify-between px-5 pt-7 pb-2.5 w-full text-3xl bg-white max-md:max-w-full">
          <Logo size={80} />
          <Button 
            onClick={handleSignIn} 
            className="my-auto hover:text-zinc-600"
          >
            SIGN IN
          </Button>
        </header>
  
        <ResponsiveImage
        src="https://cdn.builder.io/api/v1/image/assets/TEMP/035c176b3111e7416801a5f8a300cd5bf757dca0f21d610601c1aa3626b29c17?placeholderIfAbsent=true&apiKey=2e91b678645640cfb9bdb9d816fad104"
        alt="Pizza showcase banner"
        className="mt-6 aspect-[2.37] max-md:max-w-full"
      />

      <section className="flex z-10 flex-col items-center px-20 pt-16 pb-5 -mt-3 w-full bg-zinc-100 max-md:px-5 max-md:max-w-full">
        <div className="flex flex-col items-center max-w-full w-[585px]">
          <h1 className="text-6xl max-md:text-4xl">ABOUT</h1>
          <ResponsiveImage
            src="https://cdn.builder.io/api/v1/image/assets/TEMP/afb9bafbb4a55d20a0240709ad6f3c85be4a54dbe62ba36ad6c83a2ed9dd24b6?placeholderIfAbsent=true&apiKey=2e91b678645640cfb9bdb9d816fad104"
            alt="About section illustration"
            className="self-stretch aspect-[1.72] max-md:max-w-full"
          />
          <p className="mt-6 text-sm leading-5 max-md:max-w-full">
            Chúng tôi là một cửa hàng pizza hoạt động trên thị trường khu vực
            phía Nam với hơn 20 năm truyền thống. Mục tiêu chính luôn là mang
            lại sự gắn kết giữa các gia đình khi họ tụ tập để thưởng thức món
            ăn, với các nguyên liệu cổ điển và chất lượng tuyệt vời. Veneza luôn
            chú trọng đến sự truyền thống, với lợi thế là sự gần gũi với khách
            hàng, điều này là một điểm khác biệt trong thực đơn của chúng tôi.
          </p>
        </div>
      </section>

      <footer className="flex flex-col justify-center items-center px-16 py-12 w-full text-3xl text-white bg-zinc-800 max-md:px-5 max-md:max-w-full">
        <Logo className="max-w-full w-[217px]" />
      </footer>
    </div>
  );
};