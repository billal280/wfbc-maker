import os
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()

client = OpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key=os.getenv("OPENROUTER_API_KEY"),
)

def ask(model, prompt):
    return client.chat.completions.create(
        model=model,
        messages=[
            {"role": "system", "content": "Tu es un agent IA structuré."},
            {"role": "user", "content": prompt}
        ]
    ).choices[0].message.content

def router(task):
    if "code" in task:
        return "openai/gpt-4o-mini"
    if "reason" in task:
        return "anthropic/claude-3.5-sonnet"
    return "google/gemini-1.5-pro"

if __name__ == "__main__":
    while True:
        task = input("> ")
        model = router(task)
        print(f"[MODEL: {model}]")
        print(ask(model, task))