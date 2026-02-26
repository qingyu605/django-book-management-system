from django.db import models

# Create your models here.
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.contrib.auth import get_user_model

User = get_user_model()


class Category(models.Model):
    name = models.CharField(max_length=100, verbose_name=_('分类名称'))
    slug = models.SlugField(max_length=100, unique=True, verbose_name=_('URL标识'))
    description = models.TextField(blank=True, verbose_name=_('描述'))

    class Meta:
        verbose_name = _('图书分类')
        verbose_name_plural = _('图书分类')

    def __str__(self):
        return self.name


class Book(models.Model):
    STATUS_CHOICES = (
        ('published', '已发布'),
        ('draft', '草稿'),
    )

    title = models.CharField(max_length=200, verbose_name=_('书名'))
    slug = models.SlugField(max_length=200, unique=True, verbose_name=_('URL标识'))
    author = models.CharField(max_length=100, verbose_name=_('作者'))
    description = models.TextField(verbose_name=_('描述'))
    category = models.ForeignKey(
        Category,
        on_delete=models.SET_NULL,
        null=True,
        related_name='books',
        verbose_name=_('分类')
    )
    cover_image = models.ImageField(
        upload_to='book_covers/',
        verbose_name=_('封面图片')
    )
    published_date = models.DateField(verbose_name=_('出版日期'))
    status = models.CharField(
        max_length=20,
        choices=STATUS_CHOICES,
        default='draft',
        verbose_name=_('状态')
    )
    created_by = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='books_created',
        verbose_name=_('创建者')
    )
    created_at = models.DateTimeField(auto_now_add=True, verbose_name=_('创建时间'))
    updated_at = models.DateTimeField(auto_now=True, verbose_name=_('更新时间'))

    class Meta:
        verbose_name = _('图书')
        verbose_name_plural = _('图书')
        ordering = ['-created_at']

    def __str__(self):
        return self.title