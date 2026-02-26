from django.db import models

# Create your models here.
from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils.translation import gettext_lazy as _


class CustomUser(AbstractUser):
    USER_TYPE_CHOICES = (
        ('regular', '普通用户'),
        ('admin', '管理员'),
    )

    user_type = models.CharField(
        max_length=20,
        choices=USER_TYPE_CHOICES,
        default='admin',
        verbose_name=_('用户类型')
    )
    profile_picture = models.ImageField(
        upload_to='profile_pics/',
        blank=True,
        null=True,
        verbose_name=_('头像')
    )
    def get_profile_picture_url(self):
        if self.profile_picture:
            return self.profile_picture.url
        # 使用相对路径而不是依赖 settings
        return '/static/images/default-profile.png'
    bio = models.TextField(
        blank=True,
        null=True,
        verbose_name=_('个人简介')
    )

    def is_admin(self):
        return self.user_type == 'admin'

    class Meta:
        verbose_name = _('用户')
        verbose_name_plural = _('用户')