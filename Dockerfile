FROM heroku/miniconda:3

ADD ./conda-requirements.txt /tmp/conda-requirements.txt
ADD ./requirements.txt /tmp/requirements.txt
ADD ./dev-requirements.txt /tmp/dev-requirements.txt

RUN conda install --yes --file /tmp/conda-requirements.txt
RUN pip install -qr /tmp/requirements.txt
RUN pip install -qr /tmp/dev-requirements.txt

ADD ./app.py /opt/app.py
ADD ./forecaster /opt/forecaster/
ADD ./static /opt/static/
ADD ./tests /opt/tests/
WORKDIR /opt

CMD nosetests -v tests
CMD pylint forecaster

CMD gunicorn --bind 0.0.0.0:$PORT app:app
