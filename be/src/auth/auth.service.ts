import { Injectable } from '@nestjs/common';
import { LoginDto } from './dto/login.dto';
import { JwtService } from '@nestjs/jwt';
import { PrismaService } from 'prisma/prisma.service';
import { BadRequestException } from '@nestjs/common';

@Injectable()
export class AuthService {
  constructor(private readonly jwtService: JwtService,
    private readonly prismaService: PrismaService) {}

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

  // Phương thức validateUser để xác thực người dùng và so sánh mật khẩu
  private async validateUser(data: LoginDto) {
    try {
      // Truy vấn mật khẩu và thông tin người dùng từ cơ sở dữ liệu
      const result = await this.prismaService.$queryRaw`
        EXEC GetPasswordAndStoreIdByEmail @Email = ${data.email}, @Password = ${data.password}
      `;

      if (!result) {
        throw new BadRequestException('Invalid credentials');
      }

      const user = result[0];
    

      // Nếu mật khẩu hợp lệ, trả về thông tin người dùng
      return {
        id: user.id,
        email: user.email,
        role: user.role
      };
    } catch (error) {
      console.error('Error in validateUser:', error.message);
      throw new BadRequestException('Error validating user credentials');
    }
  }
}