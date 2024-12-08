// store/store.ts
import { configureStore } from '@reduxjs/toolkit';
import authReducer from './slices/authSlice';

// This function should only run on the client-side
const loadFromLocalStorage = () => {
  if (typeof window !== 'undefined') {
    const token = localStorage.getItem('csdl_token');
    const user = localStorage.getItem('user');
    return {
      token,
      user: user ? JSON.parse(user) : null,
    };
  }
  return { token: null, user: null };  // Default state when localStorage is unavailable
};

const initialState = loadFromLocalStorage(); // Load initial state from localStorage on client-side

export const makeStore = () => {
  return configureStore({
    reducer: {
      auth: authReducer,
    },
    preloadedState: {
      auth: initialState, // Use the initial state loaded from localStorage
    },
  });
};

// Infer the type of makeStore
export type AppStore = ReturnType<typeof makeStore>;
// Infer the `RootState` and `AppDispatch` types from the store itself
export type RootState = ReturnType<AppStore['getState']>;
export type AppDispatch = AppStore['dispatch'];
