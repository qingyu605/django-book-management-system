from django import forms
from .models import Book, Category
from django.utils.translation import gettext_lazy as _

class BookForm(forms.ModelForm):
    class Meta:
        model = Book
        fields = [
            'title', 'author', 'description',
            'category', 'cover_image',
            'published_date', 'status'
        ]
        widgets = {
            'published_date': forms.DateInput(attrs={'type': 'date'}),
            'description': forms.Textarea(attrs={'rows': 4}),
        }
        labels = {
            'title': _('书名'),
            'author': _('作者'),
            'description': _('描述'),
            'category': _('分类'),
            'cover_image': _('封面图片'),
            'published_date': _('出版日期'),
            'status': _('状态'),
        }

class BookSearchForm(forms.Form):
    q = forms.CharField(
        required=False,
        label=_('搜索'),
        widget=forms.TextInput(attrs={'placeholder': _('输入书名或作者...')})
    )
    category = forms.ModelChoiceField(
        queryset=Category.objects.all(),
        required=False,
        label=_('分类'),
        empty_label=_('所有分类')
    )