from setuptools import find_packages, setup

URL = 'https://github.com/vaventt/ada-fusion'
DESCRIPTION = "Advanced Data Augmentation with Diffusion Models and LLMs"

CLASSIFIERS = [
    'Intended Audience :: Developers',
    'Intended Audience :: Science/Research',
    'Topic :: Scientific/Engineering',
    'Topic :: Scientific/Engineering :: Artificial Intelligence',
    'Topic :: Scientific/Engineering :: Mathematics',
    'Topic :: Software Development',
    'Topic :: Software Development :: Libraries',
    'Topic :: Software Development :: Libraries :: Python Modules',
    'License :: OSI Approved :: MIT License',
    'Programming Language :: Python :: 3',
    'Programming Language :: Python :: 3.8',
    'Programming Language :: Python :: 3.9',
]

with open('README.md', 'r', encoding='utf-8') as readme:
    LONG_DESCRIPTION = readme.read()

setup(
    name='ada-fusion',
    version='1.0.0',
    license='MIT',
    author='Andrii Varenytsia',
    author_email='avarenitsya@gmail.com',
    packages=find_packages(include=['ada_fusion', 'ada_fusion.*']),
    classifiers=CLASSIFIERS,
    description=DESCRIPTION,
    long_description=LONG_DESCRIPTION,
    long_description_content_type='text/markdown',
    url=URL,
    keywords=['Computer Vision', 'Data Augmentation', 'Diffusion Models', 'LLM'],
    install_requires=[
        'torch>=2.0.0',
        'torchvision>=0.15.0',
        'diffusers',
        'transformers',
        'pycocotools',
        'pandas',
        'matplotlib',
        'seaborn',
        'scipy',
    ],
    python_requires='>=3.8',
)