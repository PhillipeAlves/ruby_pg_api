
def run_sql(sql, params = [])
    db = PG.connect(ENV['DATABASE_URL'] || { dbname: 'my_database' })
    results = db.exec_params(sql, params)
    db.close
    return results
end

# ===( POST )=== #

def create_data(content)
    run_sql(
        'INSERT INTO my_table (content) VALUES ($1);',
        [content]
    )
end

# ===( GET )=== #

def read_data
    run_sql(
        "SELECT * FROM my_table;",
        []
    )
end

# ===( PATCH )=== #

def update_data(content, id)
    run_sql(
        'UPDATE my_table SET content = $1 WHERE id = $2;',
        [ content, id]
    )
end

# ===( DELETE )=== #

def delete_data(id)
    run_sql(
        'DELETE FROM my_table WHERE id = $1;',
        [id]
    )
end