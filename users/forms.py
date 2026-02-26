from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _
from .models import CustomUser
from django.contrib.auth import get_user_model, authenticate


class CustomUserCreationForm(UserCreationForm):
    email = forms.EmailField(required=True, label=_('邮箱'))
    captcha = forms.CharField(
        required=True,
        label=_('验证码'),
        max_length=8,
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )

    class Meta:
        model = CustomUser
        fields = ('username', 'email', 'password1', 'password2')
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'password1': forms.PasswordInput(attrs={'class': 'form-control'}),
            'password2': forms.PasswordInput(attrs={'class': 'form-control'}),
        }

    def __init__(self, *args, **kwargs):
        # 从kwargs中获取request对象并移除它
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)
        self.fields['password1'].help_text = _('至少8个字符，不能全是数字')

    def clean_captcha(self):
        # 确保 request 存在
        if not self.request:
            raise ValidationError("无法验证验证码")

        # 获取用户输入的验证码
        user_captcha = self.cleaned_data.get('captcha')

        # 从 session 获取服务器存储的验证码
        session_captcha = self.request.session.get('captcha_code', '')  # 注意键名一致性

        # 比较验证码（通常忽略大小写）
        if user_captcha.upper() != session_captcha.upper():
            raise ValidationError("验证码错误")

        # 验证成功后清除 session 中的验证码（可选）
        if 'captcha_code' in self.request.session:
            del self.request.session['captcha_code']

        return user_captcha


class CustomAuthenticationForm(AuthenticationForm):
    captcha = forms.CharField(
        required=True,
        label=_('验证码'),
        max_length=8,
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)

    def clean_captcha(self):
        # 验证码验证逻辑保持不变
        if not self.request:
            raise ValidationError("无法验证验证码")

        user_captcha = self.cleaned_data.get('captcha')
        session_captcha = self.request.session.get('captcha_code', '')

        if user_captcha.upper() != session_captcha.upper():
            raise ValidationError("验证码错误")

        if 'captcha_code' in self.request.session:
            del self.request.session['captcha_code']

        return user_captcha

    def clean(self):
        User = get_user_model()
        # 重写clean方法，只验证用户名
        username = self.cleaned_data.get('username')

        if username:
            try:
                # 检查用户是否存在
                User.objects.get(username=username)
                # 跳过密码验证
                return self.cleaned_data
            except User.DoesNotExist:
                raise self.get_invalid_login_error()

        return super().clean()


# users/forms.py
from django import forms
from .models import CustomUser  # 注意导入 CustomUser 而非 User


class CustomLoginForm(forms.Form):
    username = forms.CharField(label='用户名')
    password = forms.CharField(label='密码', widget=forms.PasswordInput)

    def clean(self):
        cleaned_data = super().clean()
        username = cleaned_data.get('username')
        password = cleaned_data.get('password')

        if username and password:
            user = authenticate(username=username, password=password)
            if not user:
                raise forms.ValidationError('用户名或密码不正确')
        return cleaned_data


class ProfileForm(forms.ModelForm):
    class Meta:
        model = CustomUser
        fields = ['bio', 'profile_picture']  # 只包含可编辑的字段
