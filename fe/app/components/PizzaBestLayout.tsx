'use client';
import * as React from "react";
import { Logo } from "./Logo";
import { Button } from "./Button";
import { ResponsiveImage } from "./ResponsiveImage";
import { useRouter } from "next/navigation";
import Image from "next/image";

export const PizzaBestLayout: React.FC = () => {
  localStorage.removeItem('csdl_token');
  const router = useRouter(); // Khởi tạo useRouter

  const handleSignIn = React.useCallback(() => {
    // Khi bấm SIGN IN, chuyển hướng đến trang /login
    router.push("/login");
  }, [router]); // Đảm bảo router không bị thay đổi trong mỗi lần render
  
    return (
      <div className="flex overflow-hidden flex-col text-center text-zinc-800 bg-custom h-screen w-screen">
        <header className="flex flex-row gap-5 justify-between items-center px-5 pt-7 pb-2.5 w-full text-3xl bg-white max-md:max-w-full h-14 -">
          <Logo size={20}/>
        </header>
      <section className="flex z-10 flex-col items-center justify-center px-20 pt-16 pb-5 -mt-3 w-full max-md:px-2 max-md:max-w-full h-full">
        <div className="flex flex-col items-center max-w-full w-[500px] h-[430px] bg-white rounded-lg shadow-sm">
          <h1 className="text-6xl max-md:text-4xl font-serif h-[50px]">PizzaBest</h1>
          <div >
          <Image 
            src="https://cdn.builder.io/api/v1/image/assets/TEMP/afb9bafbb4a55d20a0240709ad6f3c85be4a54dbe62ba36ad6c83a2ed9dd24b6?placeholderIfAbsent=true&apiKey=2e91b678645640cfb9bdb9d816fad104"
            alt="About section illustration"
            width={300}
            height={200}
            className="aspect-[1.72] w-[300px] justify-center rounded-lg items-center py-4 h-[200px]"
          />
          </div>
          <p className="ext-sm leading-5 max-md:max-w-full text-justify px-8 h-full font-sans">
            PizzaBest là một chuỗi cửa hàng pizza hoạt động trên thị trường khu vực
            phía Nam với hơn 20 năm truyền thống. Mục tiêu chính luôn là mang
            lại sự gắn kết giữa các gia đình khi họ tụ tập để thưởng thức món
            ăn, với các nguyên liệu cổ điển và chất lượng tuyệt vời. PizzaBest luôn
            chú trọng đến sự truyền thống, với lợi thế là sự gần gũi với khách
            hàng, điều này là một điểm khác biệt trong thực đơn của chúng tôi.
          </p>
        </div>
        <Button 
            onClick={handleSignIn} 
            className="my-auto hover:bg-blue-900 text-white bg-blue-700 rounded-lg px-5 py-2"
          >
            SIGN IN
        </Button>
      </section>

      <footer className="flex flex-row justify-center items-center w-full text-3xl text-white bg-zinc-800 max-md:px- max-md:max-w-full h-[80px]">
        <div>
        <Logo className="max-w-full w-[30px]" />
        </div>
        <div className="w-11/12 flex flex-row items-end justify-end gap-32 text-sm">
        <p>Trụ sở: Tp. Thủ Đức, Tp Hồ Chí Minh</p>
        <p>Email: pizzabest@gmail.com</p>
        <p>Số điện thoại: 0123.456.789</p>
        <p>&copy; {new Date().getFullYear()} JobCenter full right reserved.</p>
        </div>
      </footer>
    </div>
  );
};