# users/views.py

from django.shortcuts import render, redirect
from django.views import View
from django.contrib.auth import login, logout
from django.contrib import messages
from django.utils.translation import gettext_lazy as _
from .forms import CustomUserCreationForm, CustomAuthenticationForm
from .utils import generate_random_code, captcha_image
from django.http import HttpResponse
from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError

class CaptchaView(View):
    def get(self, request):
        img_io = captcha_image(request)
        return HttpResponse(img_io.getvalue(), content_type='image/png')


class RegisterView(View):
    template_name = 'users/register.html'

    def get(self, request):
        form = CustomUserCreationForm(request=request)
        return render(request, self.template_name, {'form': form})

    def post(self, request):
        form = CustomUserCreationForm(request.POST, request=request)
        if form.is_valid():
            user = form.save()

            # 设置用户的backend属性
            from django.contrib.auth import authenticate
            # 这里使用默认的ModelBackend作为示例
            user.backend = 'django.contrib.auth.backends.ModelBackend'

            login(request, user)
            messages.success(request, _('注册成功！欢迎使用图书管理系统'))
            return redirect('home')

        return render(request, self.template_name, {'form': form})


class LoginView(View):
    template_name = 'users/login.html'
    User = get_user_model()

    def get(self, request):
        form = CustomAuthenticationForm()
        return render(request, self.template_name, {'form': form})

    def post(self, request):
        form = CustomAuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')

            # 只验证用户名是否存在
            try:
                user = self.User.objects.get(username=username)
                # 手动设置backend属性
                user.backend = 'django.contrib.auth.backends.ModelBackend'
                login(request, user)
                messages.success(request, _('登录成功！'))
                return redirect('home')
            except self.User.DoesNotExist:
                messages.error(request, _('用户不存在，请注册或检查用户名'))

        return render(request, self.template_name, {'form': form})


class LogoutView(View):
    def get(self, request):
        logout(request)
        messages.info(request, _('您已成功退出系统'))
        return redirect('home')


class ProfileView(View):
    template_name = 'users/profile.html'

    def get(self, request):
        return render(request, self.template_name, {'user': request.user})





