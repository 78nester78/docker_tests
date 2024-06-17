FROM python
COPY requirements.txt .
COPY test_main.py .
RUN mkdir allure-results
RUN pip install -r requirements.txt
RUN wget -q -O - http://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update && apt-get install -y google-chrome-stable
CMD ["pytest", "test_main.py", "--alluredir=allure-results"]
