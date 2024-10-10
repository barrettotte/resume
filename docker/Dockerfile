FROM texlive/texlive:latest-full

ENV RESUME_NAME="resume"

WORKDIR /resume

COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME ["/out", "/src"]

ENTRYPOINT [ "/entrypoint.sh" ]
