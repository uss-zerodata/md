"""
This script copies svg texture files from the source folder to the destination folder and replaces all the colors with the ones specified in the color dictionary.
"""

import os
import yaml

from time import sleep


def load_colors(config_path = 'tailwind_colors.yml'):
	# Load the color dictionary
	with open(config_path) as config_file:
		return yaml.load(config_file, Loader=yaml.FullLoader)

def load_generator(config_path = 'generator_config.yml'):
	# Load the generator
	with open(config_path) as config_file:
		return yaml.load(config_file, Loader=yaml.FullLoader)

def create_folder(path = 'textures/'):
	# Create folder if it doesn't exist
	if not os.path.exists(path):
		os.makedirs(path)
	return path


def read_file(file_path):
	# Open the file and read its content
	with open(file_path, 'r') as file:
		return file.read()

def write_file(file_path, content):
	# Write the content to the file
	with open(file_path, 'w') as file:
		file.write(content)


def iter_files(source_folder):
	# Iterate through all files in the source folder
	for file_path in os.listdir(source_folder):
		yield file_path, read_file(f'{source_folder}/{file_path}')

def replace_colors(content, old_color, color, brightness = None, colors = None):
	# Replace the colors in the content
	if isinstance(brightness, str) and brightness.startswith('#'):
		return content.replace(old_color, brightness)
	else:
		return content.replace(old_color, colors[color][brightness])

def generate_file_name(texture, color, brightness, contrast, mode, id):
	new_file_name = f'{texture}'
	if color != 'default':
		new_file_name += f'_{color}'
	if brightness != 'default':
		new_file_name += f'_{brightness}'
	if contrast != 'default':
		new_file_name += f'_{contrast}'
	if mode != 'default':
		new_file_name += f'_{mode}'
	new_file_name += f'_{id}.svg'
	return new_file_name

def new_segment(texture):
	# wait for user confirmation
	print(f'Starting with texture: {texture}')
	# if input('Press Enter to continue...') != '':
	# 	print('Exiting...')
	# 	exit()

def follow_generator(generator, colors, dest_folder):
	for texture in generator:
		new_segment(texture)
		for mode in generator[texture]:
			print(f'Generating {texture} {mode}...')
			for contrast in generator[texture][mode]:
				for file_name, content in iter_files(texture):
					for brightness in generator[texture][mode][contrast]:
						for color in colors:
							# Copy the content
							new_content = content

							# Replace all colors in instructions
							for old_color in generator[texture][mode][contrast][brightness]:
								new_content = replace_colors(new_content, old_color, color, generator[texture][mode][contrast][brightness][old_color], colors)
							
							# Generate the file name
							new_file_name = generate_file_name(texture, color, brightness, contrast, mode, file_name.split('.')[0])

							# Write the file
							write_file(f'{dest_folder}/{new_file_name}', new_content)


def main():
	dest_folder = create_folder("3x4/")
	colors = load_colors("tailwind_colors.yml")
	generator = load_generator("generator_config.yml")

	follow_generator(generator, colors, dest_folder)


if __name__ == '__main__':
	try:
		main()
	except KeyboardInterrupt:
		print("\nExiting...")