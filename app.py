import csv

with open('file_to_run_app.csv', 'r') as file:
    content = file.read()


if __name__ == '__main__':
    print(content)