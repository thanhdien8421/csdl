'use client';

import React, { useState, useEffect, FormEvent } from "react";
import { useAuth } from "../../hooks/useAuth";
import { useRouter } from "next/navigation"; // Dùng useRouter từ next/router
import { Logo } from "../components/Logo";

// Định nghĩa props
interface LoginProps {
  onLoginSuccess: () => void;
}

const Login: React.FC<LoginProps> = () => {
  const { login, isLoggingIn, isAuthenticated: authStatus, token, user } = useAuth();
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const router = useRouter(); // Dùng useRouter thay cho useNavigate

  const handleLogin = async (e: FormEvent) => {
    e.preventDefault();
    login({ email, password });
  };

  useEffect(() => {
    // Kiểm tra xem người dùng đã đăng nhập chưa
    if (authStatus) {
      if (user?.role === 'Admin') {
        router.push("/home"); // Chuyển hướng đến trang sau khi đăng nhập thành công
      }
      else {
        router.push("/order"); // Chuyển hướng đến trang sau khi đăng nhập thành cong
      }
    }
  }, [authStatus, router, token, user]);

  return (
    //   <div className="flex items-center justify-center min-h-screen bg-gray-50">

    //  </div>

    <div className="flex overflow-hidden flex-col text-center text-zinc-800 bg-custom h-screen w-screen">
      <header className="flex flex-row gap-5 justify-between items-center px-5 pt-7 pb-2.5 w-full text-3xl bg-white max-md:max-w-full h-14 -">
        <Logo size={20} />
      </header>
      <section className="flex z-10 flex-col items-center justify-center px-20 pt-16 pb-5 -mt-3 w-full max-md:px-2 max-md:max-w-full h-full">
        <div className="bg-white p-8 rounded-lg shadow-lg w-96">
          <h1 className="text-2xl font-semibold text-center mb-6">Đăng nhập</h1>
          <form onSubmit={handleLogin} className="space-y-4">
            <div>
              <label htmlFor="email" className="block text-sm font-medium text-gray-700">
                Email
              </label>
              <input
                id="email"
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
                className="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>

            <div>
              <label htmlFor="password" className="block text-sm font-medium text-gray-700">
                Password
              </label>
              <input
                id="password"
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
                className="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>

            <button
              type="submit"
              disabled={Boolean(isLoggingIn)}
              className={`w-full py-2 px-4 mt-4 text-white font-semibold rounded-md ${isLoggingIn ? 'bg-gray-400' : 'bg-blue-500 hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500'}`}
            >
              {isLoggingIn ? "Logging in..." : "Login"}
            </button>
          </form>
        </div>
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

export default Login;
