import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { PrismaService } from 'prisma/prisma.service';
import { JwtModule } from '@nestjs/jwt';
@Module({
  imports: [
    JwtModule.register({
        secret:'hard!to-guess_secret', // Đặt secret key của bạn, có thể thay đổi
        signOptions: { expiresIn: '1h' }, // Thời gian hết hạn của JWT token
      }),
  ],
  controllers: [AuthController],
  providers: [AuthService, PrismaService],
})
export class AuthModule {}