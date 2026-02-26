import random
import string
from io import BytesIO
from django.http import HttpResponse
from PIL import Image, ImageDraw


def generate_random_code(length=6):
    """生成随机验证码"""
    chars = string.ascii_uppercase + string.digits
    return ''.join(random.choice(chars) for _ in range(length))


def captcha_image(request):
    """生成验证码图片视图"""
    # 1. 生成随机验证码
    captcha_code = generate_random_code()

    # 2. 存储到session（用于后续验证）
    request.session['captcha_code'] = captcha_code
    # 设置session有效期（可选）
    request.session.set_expiry(30000)  # 500分钟

    # 3. 创建图片
    width, height = 120, 40
    img = Image.new('RGB', (width, height), (240, 240, 240))
    draw = ImageDraw.Draw(img)

    # 添加干扰线
    for _ in range(5):
        x1 = random.randint(0, width)
        y1 = random.randint(0, height)
        x2 = random.randint(0, width)
        y2 = random.randint(0, height)
        draw.line((x1, y1, x2, y2), fill=(180, 180, 180))

    # 绘制验证码文本
    draw.text((40, 15), captcha_code, fill=(0, 0, 0))

    # 4. 返回图片响应
    buffer = BytesIO()
    img.save(buffer, 'PNG')
    buffer.seek(0)
    return HttpResponse(buffer, content_type='image/png')