import sys
import sqlparse

contents = sys.stdin.read()
for identifier in range(10):
    contents = contents.replace(f"?{identifier}", f"__id_{identifier}")

result = sqlparse.format(contents, ident_columns=True, keyword_case="upper", identifier_case="lower", reindent=True, output_format="sql", indent_after_first=True, wrap_after=80, comma_first=False)

for identifier in range(10):
    result = result.replace(f"__id_{identifier}", f"?{identifier}")

print(result.strip())
