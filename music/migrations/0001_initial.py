# Generated by Django 3.2.7 on 2021-09-24 04:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Album',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=400)),
            ],
        ),
        migrations.CreateModel(
            name='Music',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=500)),
                ('artist', models.CharField(max_length=500)),
                ('time_length', models.DecimalField(blank=True, decimal_places=2, max_digits=20)),
                ('audio_file', models.FileField(upload_to='musics')),
                ('cover_image', models.ImageField(upload_to='music_image/')),
                ('album', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='music.album')),
            ],
        ),
    ]
