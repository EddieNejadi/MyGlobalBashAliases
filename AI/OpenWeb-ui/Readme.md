# Ollama on docker

[google.ai instruction](https://share.google/aimode/t8diCCXVumVDzVIRi)

## docker compose


## Models

- tinyllama
- llama3.1
- phi4-mini
- phi4-mini-reasoning
- gpt-oss:latest

## Goals

- Upload all document in knowledge base
- Pull lhx jira into knowledge base and possibly link it to change set
- Create agent for suggestion of code in python
- Create agent for suggestion of code in ansible
- Create agent for suggestion of code in rave

## Maintenance

### Update

```
docker compose pull
docker compose up -d

```

### Reset pass

1. Generate a new password hash
2. Update the database

```bash
# htpasswd -bnBC 10 "" pass | tr -d ':\n'
# pass =hash=> $2y$10$WAcO7G0I/3BuCmMh6Ds9TuK5i7pMaYhUhMrGv/rV3K9AtNz89ozW6

docker exec -it open-webui python3 -c '
import sqlite3
db = "/app/backend/data/webui.db"
email = "mehdi@gmail.com"
new_hash = "$2y$10$WAcO7G0I/3BuCmMh6Ds9TuK5i7pMaYhUhMrGv/rV3K9AtNz89ozW6"

with sqlite3.connect(db) as con:
    cur = con.cursor()
    # 1. Update the password in the auth table
    cur.execute("UPDATE auth SET password=? WHERE email=?", (new_hash, email))
    # 2. Ensure the user is actually an admin in the user table
    cur.execute("UPDATE user SET role=\"admin\" WHERE email=?", (email,))
    con.commit()
    print(f"Updated {cur.rowcount} rows. If 0, the email was not found.")
'
# List the admin emails and pass hashes
docker exec -it open-webui python3 -c 'import sqlite3; con = sqlite3.connect("/app/backend/data/webui.db"); cur = con.cursor(); [print(f"Email: {r[0]} | Hash: {r[1]}") for r in cur.execute("SELECT email, password FROM auth")]; con.close()'

# connect to docker container
docker exec -it open-webui bash
```
