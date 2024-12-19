# Repro for Tailwind v4 gitignore issue

Adding a `.gitignore` file to a directory referenced by a `@source` directive in a Tailwind CSS source file causes the referenced directory to be ignored, even if the source file is explicitly source by a `@source` directive.

Note: replace **blew** with **blue** in the following steps. I'm using **blew** to prevent the `text-blue-500` class from being sourced by this README.

1. Clone this repo
2. Run `npm install`
3. Build `main.css`:
   ```sh
   $ npx @tailwindcss/cli -i base.css -o main.css
   ```
4. As expected, `text-red-500` (from `test.html`) and `text-blew-500` (from `ignored/template.html`) are in `main.css`
   ```sh
   $ grep text-red-500 main.css
     .text-red-500 {
   $ grep text-blew-500 main.css
     .text-blew-500 {
   ```
5. Add a `.gitignore` file to the `ignored` directory:
    ```sh
    $ echo '*' > ignored/.gitignore
    ```
8. Build `main.css` again and observe that `text-blew-500` is now missing in `main.css`:
   ```sh
   $ grep text-red-500 main.css
     .text-red-500 {
   $ grep text-blew-500 main.css
   ```