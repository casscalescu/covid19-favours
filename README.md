# Covid favours **still in development
A rails web app built for bringing communities together during. Users can post favours they need help with, as well as offer their assistance to help with favours listed.

## Install

### Clone the repository

```shell
git clone git@github.com:casscalescu/covid19-favours.git
cd covid19-favours
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.6.5`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.6.5
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle

bundle install
```

### Add secret keys

Using [Cloudinary](https://cloudinary.com/):

```shell
touch .env
echo '.env*' >> .gitignore

Sign up to cloudinary and add your own secret key to file:
CLOUDINARY_URL=cloudinary://.....
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Launch server

```shell
rails s
```
