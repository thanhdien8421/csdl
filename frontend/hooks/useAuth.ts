'use client';

import { useDispatch, useSelector } from 'react-redux';
import { useMutation, useQueryClient } from '@tanstack/react-query';
import { setCredentials, logout } from '../store/slices/authSlice';
// import request from '../utils/request'; // Make sure this is correctly defined
import { RootState } from '../store/store';
import { useEffect, useState } from 'react';
import axios from 'axios';

// Define mutation input type (must match your API)
interface LoginInput {
  email: string;
  password: string;
}

// Define the user structure
interface User {
  id: string;
  name: string;
  email: string;
}

interface LoginResponse {
  user: User;
  token: string;
}

export const useAuth = () => {
  const dispatch = useDispatch();
  const [isClient, setIsClient] = useState(false); // Track if we're on the client-side
  const queryClient = useQueryClient();
  const { user, token } = useSelector((state: RootState) => state.auth); // Using RootState for type safety

  useEffect(() => {
    // This will ensure queryClient is only accessed on the client
    setIsClient(true);
  }, []);

  // Define mutation with LoginResponse and LoginInput types
  // const loginMutation = useMutation<LoginResponse, Error, LoginInput>({
  //   mutationFn: async (inp) => await request.post('/auth', inp),
  //   onSuccess: (data) => {
  //     dispatch(setCredentials(data)); // Update Redux store with user data
  //     if (isClient) {
  //       queryClient.invalidateQueries({ queryKey: ['user'] }); // Invalidate cache to get fresh user data
  //     }
  //   },
  // });
  const loginMutation = useMutation<LoginResponse, Error, LoginInput>({
    mutationFn: async (inp) => {
      console.log("Attempting login with:", inp); // Log the input data
      try {
        // Gửi yêu cầu đến API để đăng nhập
        const response = await axios.post('http://localhost:8000/api/auth', inp);
        console.log("Login response:", response); // Log the response from the server

        // Extract the data from the AxiosResponse and ensure it matches LoginResponse
        const loginData: LoginResponse = response.data.data; // Assuming response.data has the shape of LoginResponse

        return loginData; // Return the LoginResponse to fulfill mutation function
      } catch (error) {
        console.error("Login error:", error); // Log any error that happens during the login attempt
        throw error; // Rethrow the error to be caught by onError
      }
    },
    onSuccess: (data) => {
      console.log("Login successful:", data); // Log successful login data
      dispatch(setCredentials(data)); // Update Redux store with user data
      if (isClient) {
        queryClient.invalidateQueries({ queryKey: ['user'] }); // Invalidate cache to get fresh user data
      }
    },
    onError: (error) => {
      console.error("Login failed with error:", error); // Log the error if the mutation fails
    },
  });

  // Check if the mutation is in loading state
  const isLoading = loginMutation?.status === 'pending'; // Correct state check for loading

  const handleLogout = () => {
    dispatch(logout()); // Call logout action from slice
    if (isClient) {
      queryClient.clear(); // Clear cache on logout
    }
  };

  return {
    user,
    token,
    isAuthenticated: !!token, // Check if user is authenticated
    login: loginMutation.mutate, // Login function
    logout: handleLogout, // Logout function
    isLoggingIn: isLoading, // Show login loading state
    loginError: loginMutation.error, // Display any login errors
  };
};