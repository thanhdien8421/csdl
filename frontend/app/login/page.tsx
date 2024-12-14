// 'use client';
// import React from "react";
// import { useRouter } from "next/navigation";
// import { Button } from "../components/Button";
// const LoginPage: React.FC = () => {
//     const router = useRouter(); // Khởi tạo useRouter
//     const handleSignIn = React.useCallback(() => {
//         // Khi bấm SIGN IN, chuyển hướng đến trang /login
//         router.push("/list");
//       }, [router]); // Đảm bảo router không bị thay đổi trong mỗi lần render
//   return (
//     <div>
//       <Button 
//             onClick={handleSignIn} 
//             className="my-auto hover:text-zinc-600"
//           >
//             SIGN IN
//           </Button>
//     </div>
//   );
// };

// export default LoginPage;
// import React, { useState, useEffect, FormEvent } from "react";
// import { useAuth } from "../../hooks/useAuth";
// // import logo from "../../../assets/icons/icon_printer_black.png";
// import { Link, useNavigate } from "react-router-dom";
// // import { ENDPOINTS } from "../../../routes/endPoints";
// // import LoginForm from "../components/form";
// // import request from "../../../utils/request";

// // Định nghĩa props
// interface LoginProps {
//   onLoginSuccess: () => void;
// }

// const Login: React.FC<LoginProps> = ({ onLoginSuccess }) => {
//   const { login, isLoggingIn, loginError, isAuthenticated: authStatus } = useAuth();
//   const [email, setEmail] = useState<string>("");
//   const [password, setPassword] = useState<string>("");
//   const navigate = useNavigate();

//   const handleLogin = async (e: FormEvent) => {
//     e.preventDefault();
//     login({ email, password });
//   };

//   useEffect(() => {
//     if (!authStatus) return; // Nếu chưa đăng nhập, không làm gì cả
//     onLoginSuccess(); // Gọi hàm callback khi login thành công
//     navigate("/"); // Điều hướng đến trang dashboard
//   }, [authStatus, onLoginSuccess, navigate]);

//   return (
//     <div>
//       {/* Form Login */}
//     </div>
//   );
// };

// export default Login;
'use client';

import React, { useState, useEffect, FormEvent } from "react";
import { useAuth } from "../../hooks/useAuth";
import { useRouter } from "next/navigation"; // Dùng useRouter từ next/router

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
    <div className="flex items-center justify-center min-h-screen bg-gray-100">
  <div className="bg-white p-8 rounded-lg shadow-lg w-96">
    <h1 className="text-2xl font-semibold text-center mb-6">Login Page</h1>
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
</div>

  );
};

export default Login;
