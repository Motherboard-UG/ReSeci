# Specify your base image
FROM jaseci/jac-nlp:1.4.0.21

# Set working directory. / is fine for most scenarios.
WORKDIR /app

COPY ./backend /app

# Install any linux dependencies
ENV DEBIAN_FRONTEND=nointeractive

RUN apt -y update
RUN apt-get update

# RUN pip install jac_nlp[use_qa]
# RUN pip install jac_nlp[use_enc]
# RUN pip install jac_nlp[cl_summer]
# RUN pip install jac_nlp[bart_sum]
# RUN pip install jac_misc[cluster]

RUN jsserv makemigrations base
RUN jsserv migrate base
RUN jsserv migrate

CMD ["jsserv", "runserver", "0.0.0.0:8000"]