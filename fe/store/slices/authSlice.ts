'use client'
import { createSlice, PayloadAction } from '@reduxjs/toolkit';

interface User {
  id: string;
  role: string;
  email: string;
}

interface AuthState {
  token: string | null;
  user: User | null;  // Thêm trường `user` để lưu thông tin người dùng
}

const initialState: AuthState = {
  token: null,
  user: null,  // Mặc định là null
};

// Thêm action để xử lý login và logout
const authSlice = createSlice({
  name: 'auth',
  initialState,
  reducers: {
    setCredentials: (state, action: PayloadAction<{ token: string; user: User }>) => {
      state.token = action.payload.token;
      state.user = action.payload.user;  // Lưu thông tin người dùng
      if (typeof window !== 'undefined') {
        localStorage.setItem('csdl_token', action.payload.token);  // Lưu token vào localStorage
        localStorage.setItem('user', JSON.stringify(action.payload.user));  // Lưu thông tin người dùng vào localStorage
      }
    },
    logout: (state) => {
      state.token = null;
      state.user = null;  // Xóa thông tin người dùng khi logout
      if (typeof window !== undefined) {
        localStorage.removeItem('access_token');
        localStorage.removeItem('user');  // Xóa thông tin người dùng khỏi localStorage
      }
    },
  },
});

export const { setCredentials, logout } = authSlice.actions;
export default authSlice.reducer;


