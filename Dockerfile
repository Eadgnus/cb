FROM python:3.8
RUN apt-get update && apt-get install -y make curl vim

# 여기서 nvidia와 관련된 패키지 삭제
RUN apt-get purge -y nvidia*

WORKDIR /app/

COPY ./main.py /app/
COPY ./requirements.txt /app/

RUN pip install -r requirements.txt

CMD uvicorn --host=0.0.0.0 --port 8000 main:app
