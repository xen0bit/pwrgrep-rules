FROM ubuntu:20.04
# ruleid: prefer-json-notation
CMD python app.py
# ok: prefer-json-notation
CMD ["python", "app.py"]
# ruleid: prefer-json-notation
ENTRYPOINT python app.py
# ok: prefer-json-notation
ENTRYPOINT ["python", "app.py"]
