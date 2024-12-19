# Repro for Tailwind v4 gitignore issue

Adding a `.gitignore` file to a directory referenced by a `@source` directive in a Tailwind CSS source file causes the referenced directory to be ignored.

Having the directory referenced by a `@source` directive in the **top-level** .gitignore has no effect as expected.

Note: `text- blue -500` is written below so that the CLI doesn't accidentally source from this README.

1. Clone this repo
2. Run `npm install`
3. Ignore the `ignored` directory: `echo ignored >> .gitignore`. (optional, this just demonstrates documented behavior)
4. Build `main.css`:
   ```sh
   $ npx @tailwindcss/cli -i base.css -o main.css
   ```
5. As expected, `text-red-500` (from `test.html`) and `text- blue -500` (from `ignored/template.html`) are in `main.css`
   ```sh
   $ grep 'text-\(red\|blue\)-500' main.css
     .text-red-500 {
     .text- blue -500 {
   ```
6. Add a `.gitignore` file to the `ignored` directory:
   ```sh
   $ echo '*' > ignored/.gitignore
   ```
7. Build `main.css` again and observe that `text- blue -500` is now missing in `main.css`:
   ```sh
   $ grep 'text-\(red\|blue\)-500' main.css
     .text-red-500 {
   ```
