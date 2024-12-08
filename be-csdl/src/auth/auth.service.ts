import { Injectable } from '@nestjs/common';
import { LoginDto } from './dto/login.dto';
import { JwtService } from '@nestjs/jwt'; // Giả sử bạn dùng JWT để tạo token
import { PrismaService } from 'prisma/prisma.service';
@Injectable()
export class AuthService {
  constructor(private readonly jwtService: JwtService,
    private readonly prismaService: PrismaService,) {}

  // Phương thức login xử lý đăng nhập
  async login(data: LoginDto) {
    try {
      console.log('Login data:', JSON.stringify(data, null, 2)); // In dữ liệu
      const user = await this.validateUser(data);
  
      if (!user) {
        throw new Error('Invalid credentials');
      }
  
      const token = this.jwtService.sign({ userId: user.id });
      return { user, token };
    } catch (error) {
      console.error('Login error:', error.message);  // In lỗi nếu có
      throw new Error('Login failed');
    }
  }

  // Giả sử bạn có một phương thức để xác thực người dùng (từ cơ sở dữ liệu)
  private async validateUser(data: LoginDto) {
    // Logic kiểm tra người dùng trong database
    // Đây chỉ là ví dụ, bạn cần thêm logic để tìm người dùng trong database
    if (data.email === 'admin@example.com' && data.password === 'password') {
      return { id: 1, email: 'admin@example.com', name: 'Admin' }; // Thông tin người dùng
    }
    return null; // Không tìm thấy người dùng
  }
}