import { Controller, Get, Post, Patch, Delete, Param, Body } from '@nestjs/common';
import { ResponseMessage } from 'src/decorators/customize';
import { AuthService } from './auth.service';
import { LoginDto } from './dto/login.dto';
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Get()
  @ResponseMessage('Get employee data successfully')
  getAllEmployee() {
    return;
  }

  @Post()
  @ResponseMessage('Login successfully')
  async login(@Body() data: LoginDto) {
    // Kiểm tra và xác thực người dùng qua dịch vụ authService
    console.log('Received data in controller:', data);
    const loginResult = await this.authService.login(data);

    // Trả về thông tin người dùng đã đăng nhập và token
    return {
      user: loginResult.user,
      token: loginResult.token,
    };
  }

  @Patch()
  @ResponseMessage('Update employee data successfully')
  find() {
    return;
  }

  @Delete(':id')
  @ResponseMessage('Remove employee successfully')
  removeEmployerWithId(@Param('id') id: string) {
    return;
  }
}
