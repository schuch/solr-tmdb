FROM python:3.7
RUN apt-get update && apt-get install -y vim
COPY . /code/solr-tmdb/
WORKDIR /code
RUN pip install pysolr
RUN wget http://es-learn-to-rank.labs.o19s.com/tmdb.json
RUN wget -P solr-tmdb/solr_home/tmdb http://opennlp.sourceforge.net/models-1.5/en-sent.bin
RUN wget -P solr-tmdb/solr_home/tmdb http://opennlp.sourceforge.net/models-1.5/en-pos-maxent.bin
RUN wget -P solr-tmdb/solr_home/tmdb http://opennlp.sourceforge.net/models-1.5/en-chunker.bin
RUN wget -P solr-tmdb/solr_home/tmdb http://opennlp.sourceforge.net/models-1.5/en-token.bin
RUN chown -R 8983:8983 /code
